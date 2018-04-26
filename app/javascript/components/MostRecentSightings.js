import React, {Component} from 'react';

class MostRecentSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: []
    }
  }

  render(){

    return(
      <h3>Most Recent Sightings!!!!!</h3>
    )
  }
}

export default MostRecentSightings;
