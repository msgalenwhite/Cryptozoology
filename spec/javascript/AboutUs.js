import AboutUs from '../../app/javascript/components/AboutUs'
describe ('AboutUs', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = mount(
      <AboutUs />
    )
  })

  it ("should have 2 headers and 2 paragraphs", ()=>{
    expect(wrapper.find("h3").length).toEqual(2)
    expect(wrapper.find("p").length).toEqual(2)
  })
  it("should have 2 links", ()=>{
    expect(wrapper.find("a").length).toEqual(2)
    console.log(wrapper.find("a"))
  })
})
