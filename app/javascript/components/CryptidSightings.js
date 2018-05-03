import React, {Component} from 'react';
import SightingsContainer from '../components/SightingsContainer'

const CryptidSightings = props => {

  return(
    <div>
      <h3 className='home-page-tile-title'>
        Recent Sightings:
      </h3>
      <SightingsContainer
        cryptid_id={this.props.match.params.id}
      />
    </div>
  )
}

export default CryptidSightings;
