get '/questions' do

    results = question_id(id)

    erb :'/questions/index', locals: { all_questions: results }

end

get '/questions/create' do
    erb :'questions/new'
end

post '/questions' do
    title = params[:title]
    body = params[:body]
    votes = params[:votes];
    user_id = session[:user_id]

    create_question(title, body, votes, user_id)

    redirect '/questions'
end

get '/questions/:id' do |id|

    puts "id of questions:" + id

    results = question_id(id)

    erb :'/questions/show', locals: { question: results[0]}
end


get '/questions/:id/edit' do |id|

    results = question_id(id)
    

    erb :'questions/edit', locals: { question: results[0]}
end


put '/questions/:id' do |id|

    title = params[:title]
    body = params[:body]


    results = question_update(id, title, body)

    redirect "/questions/#{id}"

end


delete '/questions/:id' do |id|
    question = question_id(id)[0]


    delete_question(id)

    redirect "/questions"

end

