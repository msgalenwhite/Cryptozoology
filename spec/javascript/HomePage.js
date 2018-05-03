import HomePage from '../../app/javascript/containers/HomePage'
import AboutUs from '../../app/javascript/components/AboutUs'
import Inspiration from '../../app/javascript/components/Inspiration'
import SightingsContainer from '../../app/javascript/components/SightingsContainer'
import HighestRatedCryptid from '../../app/javascript/components/HighestRatedCryptid'

describe('HomePage', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <HomePage />
    )
  });

  it ("renders our most inspiring cryptozoologist", () => {
    expect(wrapper.find(Inspiration)).toBePresent()
  })
  it ("renders about us", () => {
    expect(wrapper.find(AboutUs)).toBePresent()
  })
  it ("renders list of the most recent sightings", () => {
    expect(wrapper.find(SightingsContainer)).toBePresent()
  })
  it ("displays a link to give credit for our icons", () => {
    expect(wrapper.find('.icon-credit-tag')).toHaveProp("href", "https://icons8.com")
  })
})
