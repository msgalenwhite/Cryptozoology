import React, {Component} from 'react';
import Sighting from './Sighting'

class SightingsContainer extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: [],
      currentPage: 0,
      currentUserId: parseInt(this.getCookie("userid"))
    }
    this.changeCurrentPage = this.changeCurrentPage.bind(this)
    this.currentPageSightings = this.currentPageSightings.bind(this)
    this.generateTiles = this.generateTiles.bind(this)
    this.getCookie = this.getCookie.bind(this)
    this.triggerFetch = this.triggerFetch.bind(this)
  }

  getCookie(cname) {
    var name = cname + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var ca = decodedCookie.split(';');
    for(var i = 0; i <ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
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

  changeCurrentPage(change) {
    const newPage = this.state.currentPage + change
    this.setState({
      currentPage: newPage
    })
  }

  currentPageSightings() {
    let startIndex = (this.state.currentPage * 6)
    let endIndex = startIndex + 5
    return this.state.sightings.slice(startIndex, endIndex)
  }

  sendOutVotes(sightingId, voteValue) {
    const formData = {
      sightingId: sightingId,
      userVote: voteValue,
      currentUserId: this.state.currentUserId
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
    const sightingsArray = this.currentPageSightings()

    const tiles = sightingsArray.map((sighting) => {
      const upVote = () => {
        this.sendOutVotes(sighting["id"], 1)
      }
      const downVote = () => {
        this.sendOutVotes(sighting["id"], -1)
      }
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
          upvote={upVote}
          downvote={downVote}
        />
      )
    })
    return tiles
  }

  render(){
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
