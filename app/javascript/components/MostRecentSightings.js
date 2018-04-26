import React, {Component} from 'react';
import Sighting from './Sighting'

class MostRecentSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: []
    }
  }

  render(){

    return(
      <Sighting />
    )
  }
}

export default MostRecentSightings;
