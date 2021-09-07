require "test_helper"

class TestimonialsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @testimonial = testimonials(:one)
  end

  test "should get index" do
    get testimonials_url, as: :json
    assert_response :success
  end

  test "should create testimonial" do
    assert_difference('Testimonial.count') do
      post testimonials_url, params: { testimonial: { content: @testimonial.content, name: @testimonial.name, softDelets: @testimonial.softDelets } }, as: :json
    end

    assert_response 201
  end

  test "should show testimonial" do
    get testimonial_url(@testimonial), as: :json
    assert_response :success
  end

  test "should update testimonial" do
    patch testimonial_url(@testimonial), params: { testimonial: { content: @testimonial.content, name: @testimonial.name, softDelets: @testimonial.softDelets } }, as: :json
    assert_response 200
  end

  test "should destroy testimonial" do
    assert_difference('Testimonial.count', -1) do
      delete testimonial_url(@testimonial), as: :json
    end

    assert_response 204
  end
end
