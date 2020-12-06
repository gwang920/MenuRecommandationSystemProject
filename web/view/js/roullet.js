				var numSegments = 0;
				var FoodList;
				var flag = 0;
				var theWheel;
			
				function makeRoullet() {
					location.href = "#slide03";
					//Create new wheel object specifying the parameters at creation time.
					theWheel = new Winwheel({
						'numSegments' : numSegments, // Specify number of segments.
						'outerRadius' : 212, // Set outer radius so wheel fits inside the background.
						'textFontSize' : 28, // Set font size as desired.
						'segments' : FoodList// Define segments including colour and text.
						,
						'animation' : // Specify the animation to use.
						{
							'type' : 'spinToStop',
							'duration' : 15,
							'spins' : 8,
							'callbackFinished' : alertPrize,
							'callbackSound' : playSound, // Function to call when the tick sound is to be triggered.
							'soundTrigger' : 'pin' // Specify pins are to trigger the sound, the other option is 'segment'.
						},
						'pins' : {
							'number' : 16
						// Number of pins. They space evenly around the wheel.
						}
					});
				}

				$('.go_to_roullet').click(function() {
					if (user_id != null) {
						var foodJson;
						$.ajax({
							url : "add_pre_roullet.mc",
							type : "POST",
							data : {
								"id" : user_id
							},
							success : function(data) {

								var index = 0;
								FoodList=new Array();
								numSegments=0;
								foodJson = JSON.parse(data);
								$.each(foodJson, function() {

									if (numSegments % 2 == 0) {
										numSegments++;

										FoodList.push({
											'fillStyle' : '#EAEAEA',
											'text' : this.name
										});

									} else {
										numSegments++;
										FoodList.push({
											'fillStyle' : '#F6F6F6',
											'text' : this.name
										});

									}
									makeRoullet();
									draw('img01');

								})

							}
						});

					} else {
						makeRoullet();
						draw('img01');
					}

				});

				$("#spin_button").click(function() {
					startSpin();
				});

				$("#resetWheel").click(function() {
					draw('img01');
					resetWheel();
				});

				$("#start_check").click(function() {
					location.href = "#slide04";
				});

				// -----------------------------------------------------------------
				// This function is called when the segment under the prize pointer changes
				// we can play a small tick sound here like you would expect on real prizewheels.
				// -----------------------------------------------------------------
				let audio = new Audio('tick.mp3'); // Create audio object and load tick.mp3 file.

				function playSound() {
					// Stop and rewind the sound if it already happens to be playing.
					audio.pause();
					audio.currentTime = 0;

					// Play the sound.
					audio.play();
				}

				// -------------------------------------------------------
				// Called when the spin animation has finished by the callback feature of the wheel because I specified callback in the parameters
				// note the indicated segment is passed in as a parmeter as 99% of the time you will want to know this to inform the user of their prize.
				// -------------------------------------------------------
				function alertPrize(indicatedSegment) {
					alertify.alert("당첨! " + indicatedSegment.text);
					roullet_result = indicatedSegment;

					draw(indicatedSegment.text);

					document.getElementById('food_name').innerHTML = indicatedSegment.text;
					document.getElementById('start_check').innerHTML = '검색하기';
				}

				// =======================================================================================================================
				// Code below for the power controls etc which is entirely optional. You can spin the wheel simply by
				// calling theWheel.startAnimation();
				// =======================================================================================================================
				let wheelPower = 0;
				let wheelSpinning = false;

				// -------------------------------------------------------
				// Function to handle the onClick on the power buttons.
				// -------------------------------------------------------
				function powerSelected(powerLevel) {
					// Ensure that power can't be changed while wheel is spinning.
					if (wheelSpinning == false) {
						// Reset all to grey incase this is not the first time the user has selected the power.
						document.getElementById('pw1').className = "";
						document.getElementById('pw2').className = "";
						document.getElementById('pw3').className = "";

						// Now light up all cells below-and-including the one selected by changing the class.
						if (powerLevel >= 1) {
							document.getElementById('pw1').className = "pw1";
						}

						if (powerLevel >= 2) {
							document.getElementById('pw2').className = "pw2";
						}

						if (powerLevel >= 3) {
							document.getElementById('pw3').className = "pw3";
						}

						// Set wheelPower var used when spin button is clicked.
						wheelPower = powerLevel;

						// Light up the spin button by changing it's source image and adding a clickable class to it.
						document.getElementById('spin_button').src = "view/images/button1.jpg";
						document.getElementById('spin_button').className = "clickable";
					}
				}

				// -------------------------------------------------------
				// Click handler for spin button.
				// -------------------------------------------------------
				function startSpin() {
					// Ensure that spinning can't be clicked again while already running.
					if (wheelSpinning == false) {
						// Based on the power level selected adjust the number of spins for the wheel, the more times is has
						// to rotate with the duration of the animation the quicker the wheel spins.
						if (wheelPower == 1) {
							theWheel.animation.spins = 3;
						} else if (wheelPower == 2) {
							theWheel.animation.spins = 8;
						} else if (wheelPower == 3) {
							theWheel.animation.spins = 15;
						}

						// Disable the spin button so can't click again while wheel is spinning.
						document.getElementById('spin_button').src = "view/images/button1.jpg";
						document.getElementById('spin_button').className = "";

						// Begin the spin animation by calling startAnimation on the wheel object.
						theWheel.startAnimation();

						// Set to true so that power can't be changed and spin button re-enabled during
						// the current animation. The user will have to reset before spinning again.
						wheelSpinning = true;
					}
				}

				// -------------------------------------------------------
				// Function for reset button.
				// -------------------------------------------------------
				function resetWheel() {
					theWheel.stopAnimation(false); // Stop the animation, false as param so does not call callback function.
					theWheel.rotationAngle = 0; // Re-set the wheel angle to 0 degrees.
					theWheel.draw(); // Call draw to render changes to the wheel.

					document.getElementById('pw1').className = ""; // Remove all colours from the power level indicators.
					document.getElementById('pw2').className = "";
					document.getElementById('pw3').className = "";
					document.getElementById('food_name').innerHTML="";
					document.getElementById('start_check').innerHTML="";

					wheelSpinning = false; // Reset to false to power buttons and spin can be clicked again.
				}

				// Create new wheel object specifying the parameters at creation time.
				function draw(FoodName) {
					//이미지 객체 생성
					var imgClo = new Image();
					//페이지 로드후 이미지가 로드 되었을 때 이미지 출력
					imgClo.addEventListener('load', function() {
						//로드된 이미지를 캔버스에 출력
						var ctx = document.getElementById('myCanvas')
								.getContext("2d");
						//canvas.drawImage() 함수를 사용하여 이미지 출력
						//drawImage ( image sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
						ctx.drawImage(imgClo, 20, 30, 400, 400);
					}, false);
					//이미지 경로 설정
					imgClo.src = "view/images/food/" + FoodName + ".PNG";
				}