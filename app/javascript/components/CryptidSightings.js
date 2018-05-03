import React, {Component} from 'react';
import Sighting from './Sighting'

class CryptidSightings extends Component {
  constructor(props){
    super(props);
    this.state = {
      sightings: [],
      currentUserId: ""
    }
    this.generateTiles = this.generateTiles.bind(this)
    this.sendOutVotes = this.sendOutVotes.bind(this)
    this.triggerFetch = this.triggerFetch.bind(this)
    this.getCookie = this.getCookie.bind(this)
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
    this.setState({
      cryptidId: parseInt(this.props.params.id),
      currentUserId: parseInt(this.getCookie("userid"))
    })
    this.triggerFetch()
  }

  triggerFetch() {
    debugger
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
        const newResponse = response["sightings"]

        this.setState({
          sightings: newResponse
        })
      })
      .catch ( error => console.error(`Error in fetch: ${error.message}`) );
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
    const cryptidId = parseInt(this.props.params.id)

    const tiles = this.state.sightings.map((sighting) => {
      if (sighting["cryptid_id"] === cryptidId) {
        if (this.state.currentUserId != nil) {
        const upVote = () => {
          this.sendOutVotes(sighting["id"], 1)
        }
        const downVote = () => {
          this.sendOutVotes(sighting["id"], -1)
        }
      } else {
        const upVote = () => {
                }
        const downVote = () => {
        }
      }

        return(
          <Sighting
            key={sighting["id"]}
            user_name={sighting["user_name"]}
            pic_url={sighting["cryptid_pic"]}
            cryptid_name={""}
            location={sighting["location"]}
            description={sighting["description"]}
            rating={sighting["rating"]}
            created_at={sighting["formatted_date"]}
            vote_total={sighting["vote_total"]}
            user_vote={sighting["user_vote"]}
            upvote={upVote}
            downvote={downVote}
          />
        )
      }
    })
    return tiles
  }

  render(){
    const tiles = this.generateTiles()
    return(
      <div className='sightings-for-cryptid'>
        <h3 className='home-page-tile-title'>
        </h3>
        {tiles}
      </div>
    )
  }
}

export default CryptidSightings;
