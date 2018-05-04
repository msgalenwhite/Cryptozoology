import React from 'react';

const Inspiration = props => {
  let imgSource = 'https://www.ft.com/__origami/service/image/v2/images/raw/http%3A%2F%2Fcom.ft.imagepublish.prod.s3.amazonaws.com%2F2b1c343e-02ce-11e7-aa5b-6bb07f5c8e12?source=next&fit=scale-down&width=600'

  return(
    <div id='Inspiration'>
      <h3 className='home-page-tile-title center'>Our Inspiration -
        <span className='focus-text'> Loren Coleman
        </span>
      </h3>
      <img
        className='homepageCryptoPic'
        src={imgSource}
        alt='Loren Coleman is a pioneer.'/>
      <p>
        Coleman writes on popular culture, animal mysteries, folklore, and cryptozoology.  He has appeared on television and radio interviews about cryptids. He has written articles and books on cryptozoology and other Fortean topics. He was a publicity consultant on The Mothman Prophecies. Coleman has carried out fieldwork throughout the United States, Canada, and Mexico, regarding sightings, trace evidence, and Native peoples' traditions of Sasquatch/ Windigo/ Bigfoot. Coleman has won awards for this documentary and literary work and is the founder of the International Cryptozoology Museum in Portland, Maine.
      </p>
      <p>
        Are you also inspired by the work of Loren Coleman and other professional Cryptozoologists?  Create an account and start searching!
      </p>
      <a href="https://www.ft.com/content/8adc020a-02bf-11e7-ace0-1ce02ef0def9">Picture from Financial Times</a>
    </div>
  );
};

export default Inspiration;
