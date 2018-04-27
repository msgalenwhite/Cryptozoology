import React from 'react'

const RatingBar = props => {

  return(
    <div>
      <span>{props.headerText}</span>
      <img src={props.icon} className="confidence-icon"/>
    </div>
  )
}

export default RatingBar
