import React from 'react'

const RatingBar = props => {

  return(
    <div>
      <span>{props.headerText}</span>
      <img src={props.icon} className="confidenceIcon"/>
    </div>
  )
}

export default RatingBar
