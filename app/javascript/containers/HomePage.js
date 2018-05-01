import React from 'react'
import Inspiration from '../components/Inspiration'
import HighestRatedCryptid from '../components/HighestRatedCryptid'
import MostRecentSightings from '../components/MostRecentSightings'
import AboutUs from '../components/AboutUs'

const HomePage = props => {

  return(
    <div className="home-page">
      <h1 className='index-title'>Become an Amateur Cryptozoologist!</h1>
      <div className="main-row row">
        <div className="columns small-12 medium-7 tile-background">
          <AboutUs/>
        </div>
        <div className="columns small-12 medium-5 tile-background">
          <HighestRatedCryptid/>
        </div>
      </div>
      <div className="main-row row">
        <div className="columns small-12 medium-7 tile-background">
          <Inspiration/>
        </div>
        <div className="columns small-12 medium-5 tile-background">
          <MostRecentSightings/>
        </div>
      </div>
      <a href="https://icons8.com" className='icon-credit-tag'>Icon pack by Icons8</a>
    </div>
  )
}

export default HomePage
