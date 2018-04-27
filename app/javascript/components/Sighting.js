import React from 'react'
import RatingBar from './RatingBar'
import iconData from '../constants/iconData'

const Sighting = props => {

  return(
    <div className='sightingTile row'>
      <div className='columns small-5 left_column'>
        <img className='cryptid_pic' src={props.pic_url} alt={`Cool picture of a ${cryptid_name}`} />
        <div className='user_name'>{props.user_name}</div>
        <div className='date'>(Sighted: {props.created_at})</div>
      </div>
      <div className='columns small-7 right_column'>
        <RatingBar
          headerText='Confidence in Sighting:'
          icon={iconData["confidence"][props.rating]}
        />
        <div>{props.cryptid_name}</div>
        <div>Sighted at: {props.location}</div>
        <p>{props.description}</p>
      </div>
    </div>
  )
}

export default Sighting
