import React from 'react';

const AboutUs = props =>{

  return(
    <div>
      <h3 className='home-page-tile-title'>What is Cryptozoology?</h3>
      <p>
        Cryptozoology is the study of hidden creatures.  Of course, these hidden creatures sometimes show themselves in the wild through quick snapshots or barely remembered encounters.  Cryptozoologists are the brave few who seek out these magestic creatures - and now you can be one, too!  Join our ranks as an amateur Cryptozoologist by keeping an eye out for the mythical, the odd, and the peculiar.
      </p>
      <h3 className='home-page-tile-title'>How can I help?</h3>
      <p>
        If you ever see a quick glimpse of Nessie, the famed Sea Monster from Scotland, or BigFoot, let us know!  Submit a sighting through our website, so that we can add to the zoological discussion of these beautiful creatures.  If you haven't seen one yourself (yet), flip through submissions from other amateur Cryptozoologists and vote for the sightings you believe to be the most credible.  Together, we can open this mysterious world and bring it into the public eye.  Together, we are all Cryptozoologists!
      </p>
      <div className='flex-box'>
        <a className='new-submission-button' href='/sightings/new'>Submit a Sighting</a>
        <a className='new-submission-button' href='/cryptids/new'>Submit a New Cryptid</a>
      </div>
    </div>
  )
}

export default AboutUs;
