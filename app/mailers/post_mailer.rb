class PostMailer < ApplicationMailer
    default from: "notifications@example.com"

    def welcome_email
        @user = params[:user]
        @url  = "https://sample-sns-project2.onrender.com/"
        mail(to: @user.email, subject: "私の素敵なサイトへようこそ")
    end
end
