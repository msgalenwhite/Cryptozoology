import React, {Component} from 'react';
import Sighting from './Sighting'

class MostRecentSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: []
    }
    this.generateTiles = this.generateTiles.bind(this)
  }

  componentDidMount() {
    fetch("/api/vi/sightings")
      .then ( response => {
        if ( response.ok ) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`;
          let error = new Error(errorMessage);
          throw(error);
        }
      })
      .then ( response => response.json() )
      .then ( response => {
        this.setState({
          sightings: response
        })
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  generateTiles() {
    let tiles = this.state.sightings.map((sighting) => {

      return(
        <Sighting
          user_name={sighting.user_name}
          pic_url={sighting.cryptid.pic_url}
          cryptid_name={sighting.cryptid.name}
          location={sighting.location}
          description={sighting.description}
          rating={sighting.rating}
          created_at={sighting.created_at}
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
      </div>
    )
  }
}

export default MostRecentSightings;
