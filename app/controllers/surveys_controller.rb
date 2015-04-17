class SurveysController < ApplicationController
  def index
    #Need to check how the customer will enter the page
    # 1.- the merchant is already log in and let the user use an ipad ipad or something
    # 2.- open url accesible by anyone using something merchant unique (merchant_name, uid, etc.)
    @questions = User.last.questions.roots
  end
end
