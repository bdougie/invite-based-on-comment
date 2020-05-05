FROM ruby:2.5

# Labels for GitHub to read your action
LABEL "com.github.actions.name"="Invite collaborator based on a comment"
LABEL "com.github.actions.description"="This actions will check for comments on issues for eight ".invite me" or ".invite @handle"."
# Here are all of the available icons: https://feathericons.com/
LABEL "com.github.actions.icon"="send"
# And all of the available colors: https://developer.github.com/actions/creating-github-actions/creating-a-docker-container/#label
LABEL "com.github.actions.color"="gray-dark"

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["ruby", "./action/run.rb"]
#CMD ["ls"]
