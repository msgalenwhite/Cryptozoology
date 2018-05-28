import React, {Component} from 'react';
import Sighting from './Sighting'

class SightingsContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: [],
      currentPage: 0
    }
    this.changeCurrentPage = this.changeCurrentPage.bind(this)
    this.generateTiles = this.generateTiles.bind(this)
    this.triggerFetch = this.triggerFetch.bind(this)
  }

  componentDidMount() {
    this.triggerFetch(0)
  }

  triggerFetch(page) {
    fetch(`/api/v1/sightings.json?page=${page}`, {
      credentials: 'same-origin',
      method: 'GET',
      headers: { 'Accept': 'application/json', 'Content-Type': 'application/json' }
    })
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
        this.setState({
          sightings: response["sightings"]
        })
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
  }

  changeCurrentPage(change) {
    const newPage = this.state.currentPage + change
    if (newPage >= 0) {
      this.setState({
        currentPage: newPage
      })
      this.triggerFetch(newPage)
    }
  }

  sendOutVotes(sightingId, voteValue, signed_in) {
    if (signed_in) {
      const formData = {
        sightingId: sightingId,
        userVote: voteValue
      }

      fetch("/api/v1/user_votes.json", {
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
  }

  generateTiles() {
    const sightingsArray = this.state.sightings

    const tiles = sightingsArray.map((sighting) => {
      const upVote = () => {
        this.sendOutVotes(sighting["id"], 1, sighting.belongs_to_user)
      }
      const downVote = () => {
        this.sendOutVotes(sighting["id"], -1, sighting.belongs_to_user)
      }
      return(
        <Sighting
          key={sighting["id"]}
          id={sighting["id"]}
          user_name={sighting["user_name"]}
          pic_url={sighting["cryptid_pic"]}
          cryptid_name={sighting["cryptid_name"]}
          cryptid_id={sighting["cryptid_id"]}
          location={sighting["location"]}
          description={sighting["description"]}
          rating={sighting["rating"]}
          created_at={sighting["formatted_date"]}
          vote_total={sighting["vote_total"]}
          upvote={upVote}
          downvote={downVote}
        />
      )
    })
    return tiles
  }

  render(){
    console.log(this.state)
    let tiles;
    let buttons;
    if (this.state.sightings.length > 0) {
      tiles = this.generateTiles()

      const goForward = () => {
        this.changeCurrentPage(1)
      }
      const goBack = () => {
        this.changeCurrentPage(-1)
      }

      buttons =
        <div className='button-div'>
          <button onClick={goBack} className='page-button'>Newer</button>
          <button onClick={goForward} className='page-button'>Older</button>
        </div>
    } else {
      tiles = "It doesn't look like there have been any sightings yet.  Would you like to contribute one?"
      buttons =
        <div className='button-div'>
          <a className='page-button' href='/sightings/new'>Report a Sighting</a>
        </div>
    }

    return(
      <div>
        {tiles}
        {buttons}
      </div>
    )
  }
}

export default SightingsContainer;
