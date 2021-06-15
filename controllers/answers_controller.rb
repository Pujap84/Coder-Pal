get '/questions/:question_id/answers' do

    redirect "/questions/#{question_id}"

end

get '/questions/:question_id/answers/create' do
    results = find_question(params[:question_id])
    question = results
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

# get '/questions/:question_id/answers/:id' do |question_id, id|

#     puts "id of questions:" + id

#     results = answer_id([:question_id])
#     question = results[0]

#     erb :'/answers/show', locals: { question: question}
# end


get '/questions/:question_id/answers/:id/edit' do |question_id, id|
    question_id = params[:question_id]
    answer_id = params[:id]
    question = find_question(question_id)
    answer = find_answer(id)

    erb :'/answers/edit', locals: { question: question, answer: answer}
end


put '/questions/:question_id/answers/:id' do |question_id, id|
    question_id = params[:question_id]
    body = params[:body]


    results = answer_update(id, body)

    redirect "/questions/#{question_id}"

end


delete '/questions/:question_id/answers/:id' do |question_id, id|
    question_id = params[:question_id]
    answer = find_answer(id)
    

    delete_answer(id)

    redirect "/questions/#{question_id}"

end

