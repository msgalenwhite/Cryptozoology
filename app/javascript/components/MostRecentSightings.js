import React, {Component} from 'react';
import Sighting from './Sighting'

class MostRecentSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: []
    }
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
        console.log(response)
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  render(){

    return(
      <Sighting />
    )
  }
}

export default MostRecentSightings;
