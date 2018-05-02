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
      <div className='columns small-1 sideways-thumbs'>
        <i className='fa fa-thumbs-up'></i>
        {props.user_vote}
        <i className='fa fa-thumbs-down'></i>
      </div>

      <div className='sighting-cryptid-name'>{props.cryptid_name}</div>
      <div className='columns small-5 left-column'>
        <img className='cryptid-pic' src={props.pic_url} alt={`Cool picture of a ${props.cryptid_name}`} />
        <div className='user-name'>{props.user_name}</div>
        <div className='date'>(Sighted: {props.created_at})</div>
      </div>
      <div className='columns small-7 right-column'>
        <div>
          <span>Confidence in Sighting:</span>
          <div>{icons}</div>
        </div>

        <div>Sighted at: {props.location}</div>
        <p>{props.description}</p>
      </div>
    </div>
  )
}

export default Sighting
