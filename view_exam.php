<?php
//view_exam.php
//https://www.youtube.com/watch?v=vI-ueey8PGo&list=PLxl69kCRkiI1LLWlNI6FwCj0PqKK80KCS&index=32&t=0s

include('master/Examination.php');

$exam = new Examination;

$exam->user_session_private();

include('header.php');

$exam_id = '';
$exam_status = '';
$remaining_minutes = '';

if(isset($_GET['code']))
{
	$exam_id = $exam->Get_exam_id($_GET["code"]);
	$exam->query = "
	SELECT online_exam_status, online_exam_datetime, online_exam_duration FROM online_exam_table 
	WHERE online_exam_id = '$exam_id'
	";

	$result = $exam->query_result();

	foreach($result as $row)
	{
		$exam_status = $row['online_exam_status'];
		$exam_star_time = $row['online_exam_datetime'];
		$duration = $row['online_exam_duration'] . ' minute';
		$exam_end_time = strtotime($exam_star_time . '+' . $duration);

		$exam_end_time = date('Y-m-d H:i:s', $exam_end_time);
		$remaining_minutes = strtotime($exam_end_time) - time();
	}
}
else
{
	header('location:enroll_exam.php');
}


?>

<br />
<?php
if($exam_status == 'Started')
{
	$exam->data = array(
		':user_id'		=>	$_SESSION['user_id'],
		':exam_id'		=>	$exam_id,
		':attendance_status'	=>	'Present'
	);

	$exam->query = "
	UPDATE user_exam_enroll_table 
	SET attendance_status = :attendance_status 
	WHERE user_id = :user_id 
	AND exam_id = :exam_id
	";

	$exam->execute_query();

?>
<div class="row">
	<div class="col-md-8">
		<div class="card">
			<div class="card-header">Онлайн-іспит</div>
			<div class="card-body">
				<div id="single_question_area"></div>
			</div>
		</div>
		<br />
		<div id="question_navigation_area"></div>
	</div>
	<div class="col-md-4">
		<br />
		<div align="center">
			<div id="exam_timer" data-timer="<?php echo $remaining_minutes; ?>" style="max-width:400px; width: 100%; height: 200px;"></div>
		</div>
		<br />
		<div id="user_details_area"></div>		
	</div>
</div>

<script>

$(document).ready(function(){
	var exam_id = "<?php echo $exam_id; ?>";

	load_question();
	question_navigation();

	function load_question(question_id = '')
	{
		$.ajax({
			url:"user_ajax_action.php",
			method:"POST",
			data:{exam_id:exam_id, question_id:question_id, page:'view_exam', action:'load_question'},
			success:function(data)
			{
				$('#single_question_area').html(data);
			}
		})
    }
    
	$(document).on('click', '.next', function(){
		var question_id = $(this).attr('id');
		load_question(question_id);
	});

	$(document).on('click', '.previous', function(){
		var question_id = $(this).attr('id');
		load_question(question_id);
	});

    $(document).on('click', '.end', function(){
        var exam_id = "<?php echo $exam_id; ?>";
        if (confirm("Ви впевнені в закінченні іспиту?")) {
    		$.ajax({
	    		url:"user_ajax_action.php",
		    	method:"POST",
			    data:{exam_id:exam_id, page:'view_exam', action:'end'},
			    success:function(data)
			    {
                    alert("Відповіді збережені!")
    			}
            })
            window.location = 'enroll_exam.php';
        }
    });
    
	function question_navigation()
	{
		$.ajax({
			url:"user_ajax_action.php",
			method:"POST",
			data:{exam_id:exam_id, page:'view_exam', action:'question_navigation'},
			success:function(data)
			{
				$('#question_navigation_area').html(data);
			}
		})
	}

	$(document).on('click', '.question_navigation', function(){
		var question_id = $(this).data('question_id');
		load_question(question_id);
	});

	function load_user_details()
	{
		$.ajax({
			url:"user_ajax_action.php",
			method:"POST",
			data:{exam_id:exam_id, page:'view_exam', action:'user_detail'},
			success:function(data)
			{
				$('#user_details_area').html(data);
			}
		})
	}

	load_user_details();

	$("#exam_timer").TimeCircles({ 
		time:{
			Days:{
				show: false
			},
			Hours:{
				show: false
			}
		}
	});

	setInterval(function(){
		var remaining_second = $("#exam_timer").TimeCircles().getTime();
		if(remaining_second < 1)
		{
			alert('Час іспиту закінчився');
			location.reload();
		}
	}, 1000);

	$(document).on('click', '.answer_option', function(){
        
		var question_id = $(this).data('question_id');
        var answer_option = $(this).data('id');

		$.ajax({
			url:"user_ajax_action.php",
			method:"POST",
			data:{question_id:question_id, answer_option:answer_option, exam_id:exam_id, page:'view_exam', action:'answer'},
			success:function(data)
			{
               // console.log(JSON.parse(JSON.stringify($(this).data('question_id'))))
			}
		})
	});

});
</script>
<?php
}
if($exam_status == 'Completed')
{
	$exam->query = "
	SELECT * FROM question_table 
	INNER JOIN user_exam_question_answer 
	ON user_exam_question_answer.question_id = question_table.question_id 
	WHERE question_table.online_exam_id = '$exam_id' 
	AND user_exam_question_answer.user_id = '".$_SESSION["user_id"]."'
	";

	//echo $exam->query;

	$result = $exam->query_result();
?>
	<div class="card">
		<div class="card-header">
			<div class="row">
				<div class="col-md-8">Результат онлайн-іспиту</div>
				<div class="col-md-4" align="right">
					<a href="pdf_exam_result.php?code=<?php echo $_GET["code"]; ?>" class="btn btn-danger btn-sm" target="_blank">PDF</a>
				</div>
			</div>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered table-hover">
					<tr>
						<th>Питання</th>
						<th>Вариант 1</th>
						<th>Вариант 2</th>
						<th>Вариант 3</th>
						<th>Вариант 4</th>
						<th>Ваша відповідь</th>
						<th>Вiрна Відповідь</th>
						<th>Результат</th>
						<th>Бали</th>
					</tr>
					<?php
					$total_mark = 0;

					foreach($result as $row)
					{
						$exam->query = "
						SELECT * 
						FROM option_table 
						WHERE question_id = '".$row["question_id"]."'
						";

						$sub_result = $exam->query_result();
						$user_answer = '';
						$orignal_answer = '';
						$question_result = '';

						if($row['marks'] == '0')
						{
							$question_result = '<h4 class="badge badge-dark">Без вiдповiдi</h4>';
						}

						if($row['marks'] > '0')
						{
							$question_result = '<h4 class="badge badge-success">Вiрно</h4>';
						}

						if($row['marks'] < '0')
						{
							$question_result = '<h4 class="badge badge-danger">Помилка</h4>';
						}

						echo '
						<tr>
							<td>'.$row['question_title'].'</td>
						';

						foreach($sub_result as $sub_row)
						{
							echo '<td>'.$sub_row["option_title"].'</td>';

							if($sub_row["option_number"] == $row['user_answer_option'])
							{
								$user_answer = $sub_row['option_title'];
							}

							if($sub_row['option_number'] == $row['answer_option'])
							{
								$orignal_answer = $sub_row['option_title'];
							}
						}
						echo '
						<td>'.$user_answer.'</td>
						<td>'.$orignal_answer.'</td>
						<td>'.$question_result.'</td>
						<td>'.$row["marks"].'</td>
					</tr>
						';
					}

					$exam->query = "
					SELECT SUM(marks) as total_mark FROM user_exam_question_answer 
					WHERE user_id = '".$_SESSION['user_id']."' 
					AND exam_id = '".$exam_id."'
					";

					$marks_result = $exam->query_result();

					foreach($marks_result as $row)
					{
					?>
					<tr>
						<td colspan="8" align="right">Всього балiв</td>
						<td align="right"><?php echo $row["total_mark"]; ?></td>
					</tr>
					<?php	
					}

					?>
				</table>
			</div>
		</div>
	</div>
<?php
}

?>

</div>
</body>
</html>
