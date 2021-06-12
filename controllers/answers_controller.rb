get '/questions/:question_id/answers/create' do
    erb :'answers/new', locals: {question: question}
end

post '/questions/:question_id/answers' do
    question_id = params[:question_id]
    body = params[:body]
    likess = params[:likes];
    user_id = session[:user_id]

    create_answer(question_id, body, likes, user_id)

    redirect '/questions/#{question_id}'
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

