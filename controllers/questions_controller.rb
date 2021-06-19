get '/home' do

    results = all_questions()

    erb :'/questions/index', locals: { all_questions: results }

end

get '/About-us' do

    erb :'questions/about'

end

get '/Questions' do

    results = all_questions()

    erb :'/questions/index', locals: { all_questions: results }

end


get '/questions' do

    results = all_questions()

    erb :'/questions/index', locals: { all_questions: results }

end

get '/questions/create', :auth => true do
    erb :'questions/new'
end

post '/questions', :auth => true do
    title = params[:title]
    body = params[:body]
    votes = params[:votes];
    user_id = session[:user_id]

    create_question(title, body, votes, user_id)

    redirect '/questions'
end

get '/questions/:id' do |id|

    question = find_question(id)
    answers = find_answers_by_question_id(id)
    erb :'/questions/show', locals: { question: question, answers: answers}
end

get '/questions/:id/edit' do |id|

    results = find_question(id)
    

    erb :'questions/edit', locals: { question: results}
end


put '/questions/:id' do |id|

    title = params[:title]
    body = params[:body]


    results = question_update(id, title, body)

    redirect "/questions/#{id}"

end


delete '/questions/:id' do |id|
    question = find_question(id)
    

    delete_question(id)

    redirect "/questions"

end

