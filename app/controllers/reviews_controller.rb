class ReviewsController < ApplicationController

    def index
        # this is our list page for our reviews

        @number = rand(100)

        @reviews = Review.all

    end
    # end of index

    def new

        # the form for adding a new review
        @review = Review.new

    end
    # end of new

    def create

        # take the form and save it to the database
        # a review form requires all the fields filled
        @review = Review.new(form_params)

        #saving to database
        @review.save

        #redirecting to home page
        redirect_to root_path

    end
    # end of create

    def destroy

        # find the individual review page, delete it then redirect to home page
        @review = Review.find(params[:id])
        
        #deleting the review
        @review.destroy

        #redirect to home page
        redirect_to root_path

    end
    # end of destroy

    def show

        # individual review page
        @review = Review.find(params[:id])

    end
    # end of show

    def edit
        # find the individual review page to edit
        @review = Review.find(params[:id])

    end
    # end of edit   

    

    def update

        # find the individual review
        @review = Review.find(params[:id])

        #update with the new info from the form
        @review.update(form_params)

        #redirect to somewhere new
        redirect_to review_path(@review)
    end
    # end of edit

    def form_params

        #cleaning the code
        # shortcut variable for the whole expression
        params.require(:review).permit(:title, :body, :score)

    end







end
