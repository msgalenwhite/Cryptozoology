import React, {Component} from 'react';
import Sighting from './Sighting'

class MostRecentSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: [],
      currentUserId: null
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
        let userId = response["sightings"][0]["current_user_id"]

        this.setState({
          sightings: newResponse,
          currentUserId: userId
        })
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  sendOutVotes(sightingId, voteValue, currentUserId) {
    const formData = {
      sightingId: sightingId,
      userVote: voteValue,
      userId: this.state.currentUserId
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
          user_vote={sighting["user_vote"]}
        />
      )
    })

    return tiles
  }

  render(){
    let tiles = this.generateTiles()
    let votes = () => {
      this.sendOutVotes(2,1,this.state.currentUserId)
    }
    return(
      <div>
        <h3 className='home-page-tile-title'>
          <span onClick={votes}>Recent Sightings:</span>
        </h3>
        {tiles}
      </div>
    )
  }
}

export default MostRecentSightings;
