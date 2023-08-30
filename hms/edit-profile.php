<?php
session_start();
//error_reporting(0);
include('include/config.php');
include('include/checklogin.php');
check_login();

if ($_SESSION['id']) $user_id = $_SESSION['id'];

if (isset($_POST['submit'])) {
	$fname = $_POST['fname'];
	$address = $_POST['address'];
	$city = $_POST['city'];
	$gender = $_POST['gender'];

	$sql = mysqli_query($con, "Update users set fullName='$fname',address='$address',city='$city',gender='$gender' where id='" . $_SESSION['id'] . "'");

	if ($sql) {
		$msg = "Your Profile updated Successfully";
	}

	//upload image
	if (isset($_FILES["image"])) {

		$uploaded_image = $_FILES["image"];

		$img_name = $uploaded_image["name"];
		$img_size = $uploaded_image["size"];
		$tmp_name = $uploaded_image["tmp_name"];
		$error = $uploaded_image["error"];

		//No error
		if ($error === 0) {
			if ($img_size > 5000000) {
				$error_msg = "File must be 5mb or lower. ";
				header("Location: ../edit-profile?error=$error_msg");
				exit();
			} else {
				$img_ex = pathinfo($img_name, PATHINFO_EXTENSION);
				$img_ex = strtolower($img_ex);

				$extensions = array("jpg", "jpeg", "png");

				if (in_array($img_ex, $extensions)) {
					$new_img_name = uniqid("IMG-", true) . "." . $img_ex;

					$path = "./uploads/" . $new_img_name;
					move_uploaded_file($tmp_name, $path);

					//Insert to database
					$qryCheckExistence = "SELECT * FROM uploads
										  WHERE user_id = $user_id";

					if ($result = $con->query($qryCheckExistence)) {

						//Delete previous file
						$previous_file_path = isset($_POST["previous_file"]) ? "./uploads/" . $_POST["previous_file"] : "";

						if (file_exists($previous_file_path)) { // Check if file exists
							unlink($previous_file_path); // Delete file
						}

						$qryDelete = "DELETE FROM uploads
									  WHERE image_url = '{$_POST["previous_file"]}'";

						if ($con->query($qryDelete))

							//Insert
							$qry = "INSERT INTO uploads(user_id, image_url)
						VALUES(?, ?)";

						$stmt = $con->stmt_init();

						$stmt->prepare($qry);

						$stmt->bind_param(
							"is",
							$user_id,
							$new_img_name
						);

						if (!$stmt->execute()) {
							die($con->error);
						}
					}

					$msg = "Your uploaded file is updated successfully";
					header("Location: ./edit-profile.php?success=$msg");
					exit();
				} else {
					$error_msg = "Invalid file extension";
					header("Location: ./edit-profile.php?error=$error_msg");
					exit();
				}
			}
		} else {
			$error_msg = "Unknown error occured!";
			header("Location: ./edit-profile.php?error=$error_msg");
			exit();
		}
	} else {
		header("Location: ./edit-profile.php");
		exit();
	}
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>User | Edit Profile</title>

	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
	<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
	<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
	<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
	<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
	<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
	<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
	<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
	<link rel="stylesheet" href="assets/css/styles.css">
	<link rel="stylesheet" href="assets/css/plugins.css">
	<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />

</head>

<body>
	<div id="app">
		<?php include('include/sidebar.php'); ?>
		<div class="app-content">

			<?php include('include/header.php'); ?>

			<!-- end: TOP NAVBAR -->
			<div class="main-content">
				<div class="wrap-content container" id="container">
					<!-- start: PAGE TITLE -->
					<section id="page-title">
						<div class="row">
							<div class="col-sm-8">
								<h1 class="mainTitle">User | Edit Profile</h1>
							</div>
							<ol class="breadcrumb">
								<li>
									<span>User </span>
								</li>
								<li class="active">
									<span>Edit Profile</span>
								</li>
							</ol>
						</div>
					</section>
					<!-- end: PAGE TITLE -->
					<!-- start: BASIC EXAMPLE -->
					<div class="container-fluid container-fullw bg-white">
						<div class="row">
							<div class="col-md-12">
								<h5 style="color: green; font-size:18px; ">
									<?php if ($msg) {
										echo htmlentities($msg);
									} ?> </h5>
								<div class="row margin-top-30">
									<div class="col-lg-8 col-md-12">
										<div class="panel panel-white">
											<div class="panel-heading">
												<h5 class="panel-title">Edit Profile</h5>
												<h5 class="panel-title" style="color: green;"><?= $_GET["success"] ?></h5>
											</div>
											<div class="panel-body">
												<?php
												$sql = mysqli_query($con, "select * from users where id='" . $_SESSION['id'] . "'");
												while ($data = mysqli_fetch_array($sql)) {
												?>
													<h4><?php echo htmlentities($data['fullName']); ?>'s Profile</h4>
													<p><b>Profile Reg. Date: </b><?php echo htmlentities($data['regDate']); ?></p>
													<?php if ($data['updationDate']) { ?>
														<p><b>Profile Last Updation Date: </b><?php echo htmlentities($data['updationDate']); ?></p>
													<?php } ?>
													<hr />
													<form role="form" name="edit" method="post" enctype="multipart/form-data">


														<div class="form-group">
															<label for="fname">
																User Name
															</label>
															<input type="text" name="fname" class="form-control" value="<?php echo htmlentities($data['fullName']); ?>">
														</div>


														<div class="form-group">
															<label for="address">
																Address
															</label>
															<textarea name="address" class="form-control"><?php echo htmlentities($data['address']); ?></textarea>
														</div>
														<div class="form-group">
															<label for="city">
																City
															</label>
															<input type="text" name="city" class="form-control" required="required" value="<?php echo htmlentities($data['city']); ?>">
														</div>

														<div class="form-group">
															<label for="gender">
																Gender
															</label>

															<select name="gender" class="form-control" required="required">
																<option value="<?php echo htmlentities($data['gender']); ?>"><?php echo htmlentities($data['gender']); ?></option>
																<option value="male">Male</option>
																<option value="female">Female</option>
																<option value="other">Other</option>
															</select>

														</div>

														<div class="form-group">
															<label for="fess">
																User Email
															</label>
															<input type="email" name="uemail" class="form-control" readonly="readonly" value="<?php echo htmlentities($data['email']); ?>">
															<a href="change-emaild.php">Update your email id</a>
														</div>

														<div style="margin-top: 1rem">
															<p style="font-size: 1.1em;">Upload File &nbsp; <span style="color: red;"><?= $_GET["error_msg"] ?></span></p>
															<input type="file" name="image" class="upload-input btn btn-o btn-primary" />
															<input type="hidden" name="previous_file" id="previousFile" />
														</div>


														<button style="margin-top: 1rem" type="submit" name="submit" class="btn btn-o btn-primary">
															Update
														</button>

													</form>
												<?php } ?>
											</div>
										</div>
									</div>

								</div>
							</div>
							<div class="col-lg-12 col-md-12">
								<div class="panel panel-white">

								</div>
							</div>
						</div>
					</div>

					<!-- end: BASIC EXAMPLE -->






					<!-- end: SELECT BOXES -->

				</div>
			</div>
		</div>
		<!-- start: FOOTER -->
		<?php include('include/footer.php'); ?>
		<!-- end: FOOTER -->

		<!-- start: SETTINGS -->
		<?php include('include/setting.php'); ?>

		<!-- end: SETTINGS -->
	</div>

	<script>
		$(document).ready(function() {

			$('.upload-btn').click(function() {
				$('.upload-input').click()
			})

			let filename = $('.profile-picture').attr('id') ? $('.profile-picture').attr('id') : "nope";

			$('#previousFile').val(filename)

			//Listen to file upload
			$('.upload-input').change(function() {
				if ($(this).val() != "") {
					//process uploaded image here...





				}
			})



		})
	</script>

	<!-- start: MAIN JAVASCRIPTS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="vendor/modernizr/modernizr.js"></script>
	<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script src="vendor/switchery/switchery.min.js"></script>
	<!-- end: MAIN JAVASCRIPTS -->
	<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
	<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
	<script src="vendor/autosize/autosize.min.js"></script>
	<script src="vendor/selectFx/classie.js"></script>
	<script src="vendor/selectFx/selectFx.js"></script>
	<script src="vendor/select2/select2.min.js"></script>
	<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
	<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
	<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
	<!-- start: CLIP-TWO JAVASCRIPTS -->
	<script src="assets/js/main.js"></script>
	<!-- start: JavaScript Event Handlers for this page -->
	<script src="assets/js/form-elements.js"></script>
	<script>
		jQuery(document).ready(function() {
			Main.init();
			FormElements.init();
		});
	</script>
	<!-- end: JavaScript Event Handlers for this page -->
	<!-- end: CLIP-TWO JAVASCRIPTS -->
</body>

</html>