import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import HomePage from './HomePage'
import SightingsContainer from '../components/SightingsContainer'
import CryptidSightings from '../components/CryptidSightings'

const App = props => {

  return(
    <Router history={browserHistory}>
      <Route path='/' component={HomePage} />
      <Route path={`/cryptids/:id`} component={CryptidSightings} />
    </Router>
  )
}

export default App
