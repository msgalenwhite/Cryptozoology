import Inspiration from '../../app/javascript/components/Inspiration'

describe ('Inspiration', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <Inspiration />
    )
  })

  it ("should have a title", () => {
    expect(wrapper.find("h3").text()).toContain("Our Inspiration -")
  })
  it ("should have an image", () => {
    expect(wrapper.find("img")).toHaveProp("className", "homepageCryptoPic")
  })
  it ("should have at least one paragraph of text", () => {
    expect(wrapper.find("p")).toBePresent()
  })
  it ("should have a credit link", () => {
    expect(wrapper.find("a").text()).toContain("Picture from")
  })
})
