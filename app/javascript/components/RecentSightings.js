import React from 'react'
import SightingsContainer from '../components/SightingsContainer'

const RecentSightings = props => {

  return(
    <div>
      <h3 className='home-page-tile-title'>
        Recent Sightings:
      </h3>
      <SightingsContainer />
    </div>
  )
}

export default RecentSightings
