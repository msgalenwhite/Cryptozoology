import React from 'react'
import SightingsContainer from '../components/SightingsContainer'

const MostRecentSightings = props => {

  return(
    <div>
      <h3 className='home-page-tile-title'>
        Recent Sightings:
      </h3>
      <SightingsContainer />
    </div>
  )
}

export default MostRecentSightings
