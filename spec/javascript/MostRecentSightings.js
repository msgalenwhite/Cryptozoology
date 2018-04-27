import MostRecentSightings from '../../app/javascript/components/MostRecentSightings'
import Sighting '../../app/javascript/components/Sighting'

describe('HomePage', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <MostRecentSightings />
    )
  });

  it ("renders a list of Sighting components", () => {
    expect(wrapper.find(Sighting)).toBePresent()
  })
})
