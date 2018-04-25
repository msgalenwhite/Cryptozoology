import React from 'react'
import CurrentCrypto from '../components/CurrentCrypto'
import HighestRatedCryptid from '../components/HighestRatedCryptid'
import MostRecentSightings from '../components/MostRecentSightings'
import AboutUs from '../components/AboutUs'

const HomePage = props => {

  return(
    <div className="page">
      <div className="row">
        <div className="columns small-12 medium-8 tile-background">
          <AboutUs/>
        </div>
        <div className="columns small-12 medium-4 tile-background">
          <HighestRatedCryptid/>
        </div>
      </div>
      <div className="row">
        <div className="columns small-12 medium-8 tile-background">
          <CurrentCrypto/>
        </div>
        <div className="columns small-12 medium-4 tile-background">
          <MostRecentSightings/>
        </div>
      </div>
    </div>
  )
}

export default HomePage
