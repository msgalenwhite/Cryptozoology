import React from 'react'
import { Router, Route, IndexRoute, browserHistory } from 'react-router';
import HomePage from './HomePage'
import MostRecentSightings from '../components/MostRecentSightings'

const App = props => {

  return(
    <Router history={browserHistory}>
      <Route path='/' >
        <IndexRoute component={HomePage} />
        <Route path='/regions/:id' component={MostRecentSightings} />
      </Route>
    </Router>
  )
}

export default App
