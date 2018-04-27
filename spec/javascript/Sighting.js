import Sighting '../../app/javascript/components/Sighting'
import RatingBar '../../app/javascript/components/RatingBar'

describe('HomePage', () => {
  let wrapper;
  let url = "https://cdn.pixabay.com/photo/2018/04/23/13/27/dragon-3344226_960_720.jpg"

  beforeEach(() => {
    wrapper = mount(
      <Sighting
        user_name="John"
        pic_url={url}
        cryptid_name="Cool Dragon"
        location="Around the Corner"
        description="It was a wonderful occurance"
        rating="3"
        created_at="April 3"
      />
    )
  });

  it ("renders a RatingBar component", () => {
    expect(wrapper.find(RatingBar)).toBePresent()
  })
  it ("displays an image", () => {
    expect(wrapper.find(img)).toHaveProp("src", url)

  })
})
