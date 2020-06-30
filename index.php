<?php

//index.php

include('master/Examination.php');

$exam = new Examination;

include('header.php');

?>

	<div class="containter">
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<?php
		if(isset($_SESSION["user_id"]))
		{

		?>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<select name="exam_list" id="exam_list" class="form-control input-lg">
					<option value="">Виберіть іспит</option>
					<?php

					echo $exam->Fill_exam_list();

					?>
				</select>
				<br />
				<span id="exam_details"></span>
			</div>
			<div class="col-md-3"></div>
		</div>
		<script>
		$(document).ready(function(){

			$('#exam_list').parsley();

			var exam_id = '';

			$('#exam_list').change(function(){

				$('#exam_list').attr('required', 'required');

				if($('#exam_list').parsley().validate())
				{
					exam_id = $('#exam_list').val();
					$.ajax({
						url:"user_ajax_action.php",
						method:"POST",
						data:{action:'fetch_exam', page:'index', exam_id:exam_id},
						success:function(data)
						{
							$('#exam_details').html(data);
						}
					});
				}
			});

			$(document).on('click', '#enroll_button', function(){
				exam_id = $('#enroll_button').data('exam_id');
				$.ajax({
					url:"user_ajax_action.php",
					method:"POST",
					data:{action:'enroll_exam', page:'index', exam_id:exam_id},
					beforeSend:function()
					{
						$('#enroll_button').attr('disabled', 'disabled');
						$('#enroll_button').text('Зачекайте...');
					},
					success:function()
					{
						$('#enroll_button').attr('disabled', false);
						$('#enroll_button').removeClass('btn-warning');
						$('#enroll_button').addClass('btn-success');
						$('#enroll_button').text('Запис успішний');
					}
				});
			});

		});
		</script>
		<?php
		}
		else
		{
		?>
		<div align="center">
			<p><a href="register.php" class="btn btn-warning btn-lg">Зареєструватись</a></p>
			<p><a href="login.php" class="btn btn-dark btn-lg">Вхiд</a></p>
		</div>
		<?php
		}
		?>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
	</div>
</div>
</body>

</html>