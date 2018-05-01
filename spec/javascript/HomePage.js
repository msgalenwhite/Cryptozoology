import HomePage from '../../app/javascript/containers/HomePage'
import AboutUs from '../../app/javascript/components/AboutUs'
import Inspiration from '../../app/javascript/components/Inspiration'
import MostRecentSightings from '../../app/javascript/components/MostRecentSightings'
import HighestRatedCryptid from '../../app/javascript/components/HighestRatedCryptid'

describe('HomePage', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <HomePage />
    )
  });

  it ("renders highest rated cryptozoologist", () => {
    expect(wrapper.find(Inspiration)).toBePresent()
  })
  it ("renders about us", () => {
    expect(wrapper.find(AboutUs)).toBePresent()
  })
  it ("renders list of the most recent sightings", () => {
    expect(wrapper.find(MostRecentSightings)).toBePresent()
  })
  it ("renders list of highest rated cryptids", () => {
    expect(wrapper.find(HighestRatedCryptid)).toBePresent()
  })
  it ("displays a link to give credit for our icons", () => {
    expect(wrapper.find('a')).toHaveProp("href", "https://icons8.com")
  })
})
