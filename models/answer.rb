# def question_id(id)
#     run_sql("SELECT * FROM questions WHERE id=$1", [id])
# end

def create_answer(question_id, body, likes, user_id)
    sql_query = "INSERT INTO answers (question_id, body, likes, user_id) VALUES ($1, $2, $3, $4);"; 
    params = [question_id, body, likes, user_id]
    run_sql(sql_query, params)
end

def question_id([:question_id])
    run_sql("SELECT * FROM questions WHERE id=$1", [id])
end