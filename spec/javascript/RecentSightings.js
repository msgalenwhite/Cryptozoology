import MostRecentSightings from '../../app/javascript/components/MostRecentSightings'
import SightingsContainer from '../../app/javascript/components/SightingsContainer'

describe ('MostRecentSightings', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <MostRecentSightings />
    )
  })

  it ("renders a header", () => {
    expect(wrapper.find('h3').text()).toEqual("Recent Sightings:")
  })
  it ("renders a SightingsContainer", () => {
    expect(wrapper.find(SightingsContainer)).toBePresent();
  })
})
