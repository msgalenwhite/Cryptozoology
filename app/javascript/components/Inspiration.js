import React from 'react';

const Inspiration = props => {
  let imgSource = 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/43/John_Oliver_November_2016.jpg/1200px-John_Oliver_November_2016.jpg'

  return(
    <div id='Inspiration'>
      <h3 className='home-page-tile-title center'>Our Inspiration -
        <span className='focus-text'> John Oliver
        </span>
      </h3>
      <img
        className='homepageCryptoPic'
        src={imgSource}
        alt='John Oliver is so handsome and cool'/>
      <p>
        A beloved television host, John Oliver is also known as an amateur cryptozoologist.  He was unavailable for comment, but his wild antics on television have helped to bring needed focus to the neglected mysteries of the wild 'crypto.'
      </p>
      <p>
        Are you also inspired by the wonderful John Oliver?  Create an account and start searching!
      </p>
      <a href="https://en.wikipedia.org/wiki/John_Oliver">Picture from Wikipedia</a>
    </div>
  );
};

export default Inspiration;
