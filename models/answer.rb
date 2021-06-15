def answers()
    run_sql("SELECT * FROM answers;")
end

def create_answer(question_id, body, likes, user_id)
    sql_query = "INSERT INTO answers (question_id, body, likes, user_id) VALUES ($1, $2, $3, $4);"; 
    params = [question_id, body, likes, user_id]
    run_sql(sql_query, params)
end

def find_answers_by_question_id(question_id)
    run_sql("SELECT * FROM answers WHERE question_id=$1", [question_id])
end

def find_answer(id)
    run_sql("SELECT * FROM answers WHERE id=$1", [id])[0]
end

def answer_update(id, body)
    params = [id, body]
    run_sql("UPDATE answers SET body = $2 WHERE id= $1", params)
end

def delete_answer(id)
    run_sql("DELETE FROM answers WHERE id = $1", [id])
end