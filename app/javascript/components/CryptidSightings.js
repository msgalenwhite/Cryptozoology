import React, {Component} from 'react';
import Sighting from './Sighting'

class CryptidSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: []
    }
    this.generateTiles = this.generateTiles.bind(this)
  }

  componentDidMount() {
    this.setState({
      cryptidId: parseInt(this.props.params.id)
    })
    fetch('/api/v1/sightings')
      .then ( response => {
        if ( response.ok ) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`;
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then ( response => response.json() )
      .then ( response => {
        const newResponse = response["sightings"]

        this.setState({
          sightings: newResponse
        })
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  generateTiles() {
    const cryptidId = parseInt(this.props.params.id)
    const tiles = this.state.sightings.map((sighting) => {
      if (sighting["cryptid_id"] === cryptidId) {
        return(
          <Sighting
            key={sighting["id"]}
            user_name={sighting["user_name"]}
            pic_url={sighting["cryptid_pic"]}
            cryptid_name={sighting["cryptid_name"]}
            location={sighting["location"]}
            description={sighting["description"]}
            rating={sighting["rating"]}
            created_at={sighting["formatted_date"]}
          />
        )
      }
    })
    return tiles
  }

  render(){
    const tiles = this.generateTiles()
    return(
      <div className='sightings-for-cryptid'>
        <h3 className='home-page-tile-title'>
        </h3>
        {tiles}
      </div>
    )
  }
}

export default CryptidSightings;
