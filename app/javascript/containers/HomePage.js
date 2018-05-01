import React from 'react'
import CurrentCrypto from '../components/CurrentCrypto'
import HighestRatedCryptid from '../components/HighestRatedCryptid'
import MostRecentSightings from '../components/MostRecentSightings'
import AboutUs from '../components/AboutUs'

const HomePage = props => {

  return(
    <div className="home-page">
      <h1 className='index-title'>Become an Amateur Cryptozoologist!</h1>
      <div>
        <div className="tile-background">
          <AboutUs/>
        </div>
        <div className="tile-background">
          <HighestRatedCryptid/>
        </div>
      </div>
      <div>
        <div className="tile-background">
          <CurrentCrypto/>
        </div>
        <div className="tile-background">
          <MostRecentSightings/>
        </div>
      </div>
      <a href="https://icons8.com" className='icon-credit-tag'>Icon pack by Icons8</a>
    </div>
  )
}

export default HomePage
