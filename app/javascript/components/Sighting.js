import React from 'react'
import RatingBar from './RatingBar'
import iconData from '../constants/iconData'

const Sighting = props => {
  let icons = iconData["confidence"].map((icon) => {
    
  })

  return(
    <div className='sighting-tile row'>
      <div className='columns small-5 left-column'>
        <img className='cryptid-pic' src={props.pic_url} alt={`Cool picture of a ${props.cryptid_name}`} />
        <div className='user-name'>{props.user_name}</div>
        <div className='date'>(Sighted: {props.created_at})</div>
      </div>
      <div className='columns small-7 right-column'>
        <div>
          Confidence in Sighting:
          {icons}
        </div>
        <div>{props.cryptid_name}</div>
        <div>Sighted at: {props.location}</div>
        <p>{props.description}</p>
      </div>
    </div>
  )
}

export default Sighting
