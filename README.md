# Ellen's Theatre Community

_A Ruby on Rails app to allow users to review and document productions of the plays of Sarah Ruhl, and to share experiences of her plays._
 
This is a community-building app, allowing users to engage in meaningful discussion not only about a series of plays, but about the interpretations of those plays inherent in production. The app is hosted online [here](ellens-theatre-community.herokuapp.com).

TWhen a user registers with this website (using the [devise](https://github.com/plataformatec/devise) gem), he or she may add a production of a play; add their own impression (a review) of the play; add images of the production they've seen, and comment on others' impressions.

The user "owns" his or her productions, impressions, images, and comments, and retains the ability to edit or to delete them. It is possible to access a user profile, which includes all of his or her input. It is possible to view all of the content on the site without registering, though the various action links will not appear.

Images are uploaded using the [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) and [MiniMagick](https://github.com/minimagick/minimagick) gems; they are stored using [Amazon's s3](http://aws.amazon.com/s3/) service.

This app uses ruby 2.1.5, and Rails 4.1.8.

The responsive accordion effect on the "View Plays" page is achieved using CSS animation and Javascript.
