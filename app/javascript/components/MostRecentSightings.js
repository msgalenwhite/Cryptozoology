import React, {Component} from 'react';
import Sighting from './Sighting'

class MostRecentSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: []
    }
    this.generateTiles = this.generateTiles.bind(this)
    this.sendOutVotes = this.sendOutVotes.bind(this)
    this.triggerFetch = this.triggerFetch.bind(this)
  }

  componentDidMount() {
    this.triggerFetch()
  }

  triggerFetch() {
    fetch('/api/v1/sightings')
      .then ( response => {
        if ( response.ok ) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`;
            error = new Error(errorMessage);
          throw(error);
        }
      })
      .then ( response => response.json() )
      .then ( response => {
        let newResponse = response["sightings"]

        this.setState({
          sightings: newResponse
        })
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  sendOutVotes(sightingId, voteValue) {
    const formData = {
      sightingId: sightingId,
      userVote: voteValue
    }

    fetch("/api/v1/user_votes", {
      credentials: 'same-origin',
      method: 'POST',
      body: JSON.stringify(formData),
      headers: { 'Content-Type': 'application/json' }
    })
      .then ( response => {
        if ( response.ok ) {
          return response;
        } else {
          let errorMessage = `${response.status} (${response.statusText})`;
          let error = new Error(errorMessage);
          throw(error);
        }
      })
      .then ( response => response.json() )
      .then ( response => {
        this.triggerFetch()
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  generateTiles() {
    const tiles = this.state.sightings.map((sighting) => {
      return(
        <Sighting
          key={sighting["id"]}
          user_name={sighting["user_name"]}
          pic_url={sighting["cryptid_pic"]}
          cryptid_name={sighting["cryptid_name"]}
          location={sighting["location"]}
          description={sighting["description"]}
          rating={sighting["rating"]}
          created_at={sighting["formatted_date"]}
          vote_total={sighting["vote_total"]}
        />
      )
    })

    return tiles
  }

  render(){
    let tiles = this.generateTiles()

    return(
      <div>
        <h3 className='home-page-tile-title'>
          <span>Recent Sightings:</span>
        </h3>
        {tiles}
      </div>
    )
  }
}

export default MostRecentSightings;
