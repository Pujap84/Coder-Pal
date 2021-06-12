get '/questions/:question_id/answers' do

    redirect "/questions/#{question_id}"

end

get '/questions/:question_id/answers/create' do
    results = question_id(params[:question_id])
    question = results[0]
    erb :'answers/new', locals: {question: question}
end

post '/questions/:question_id/answers' do
    question_id = params[:question_id]
    body = params[:body]
    likes = params[:likes];
    user_id = session[:user_id]

    create_answer(question_id, body, likes, user_id)

    redirect "/questions/#{question_id}"
end

get '/questions/:question_id/answers/:id' do |id|

    puts "id of questions:" + id

    results = question_id([:question_id])
    question = results[0]

    erb :'/answers/show', locals: { question: question}
end


get '/questions/:question_id/answers/:id/edit' do |id|

    results = question_id(id)
    

    erb :'answers/edit', locals: { question: results[0]}
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

