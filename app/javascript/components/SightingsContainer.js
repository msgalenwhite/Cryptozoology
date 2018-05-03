import React, {Component} from 'react';
import Sighting from './Sighting'

class SightingsContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: [],
      currentPage: 0
    }
    this.generateTiles = this.generateTiles.bind(this)
  }

  componentDidMount() {
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
        let newResponse = response["sightings"]
        this.setState({
          sightings: newResponse
        })
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  generateTiles() {
    let tiles = this.state.sightings.map((sighting) => {
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
    })

    return tiles
  }

  render(){
    let tiles = this.generateTiles()

    return(
      <div>
        {tiles}
        <div className='button-div'>
          <button className='page-button'>Newer</button>
          <button className='page-button'>Older</button>
        </div>
      </div>
    )
  }
}

export default SightingsContainer;
