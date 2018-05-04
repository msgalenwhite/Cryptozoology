import React from 'react'
import RatingBar from './RatingBar'
import iconData from '../constants/iconData'

const Sighting = props => {
  let icons = Object.entries(iconData['confidence']).map((miniArray) => {
    let rating = miniArray[0]
    let iconSrc = miniArray[1]
    let className = 'confidence-icon';

    if (parseInt(rating) === props.rating) {
      className = 'confidence-icon chosen-icon'
    }

    return (
      <img
        key={rating}
        src={iconSrc}
        alt='confidence-rating'
        className={className}
      />
    )
  })

  return(
    <div className='sighting-tile row'>
      <div className='sighting-cryptid-name'>
        <a href={`/cryptids/${props.cryptid_id}`} className='sighting-link'>
          <span className='sighting-link-text'>{props.cryptid_name}</span>
        </a>
      </div>
      <div className='columns small-1 sideways-thumbs'>
        <div className='icons'>
          <i className='fa fa-thumbs-up' onClick={props.upvote}></i>
          {props.vote_total}
          <i className='fa fa-thumbs-down' onClick={props.downvote}></i>
        </div>
      </div>
      <div className='columns small-12 medium-4 large-3 left-column'>
        <img className='cryptid-pic' src={props.pic_url} alt={`Cool picture of a ${props.cryptid_name}`} />
        <div className='user-name'>{props.user_name}</div>
        <div className='date'>(Sighted: {props.created_at})</div>
      </div>
      <div className='columns small-12 medium-7 large-8  right-column'>
        <div>
          <span>Confidence in Sighting:</span>
          <div>{icons}</div>
        </div>

        <div>Sighted at: {props.location}</div>
      </div>
      <div className='row'>
        <p className='columns small-12 sighting-description'>{props.description}</p>
      </div>
      <div className="button-div">
        <a href={`/sightings/destroy/${props.id}`}>Delete</a>
        <a href={`/sightings/${props.id}/edit`}>Edit</a>
      </div>
      <hr/>
    </div>
  )
}

export default Sighting
