$(document)
		.ready(
				function() {
					$.datepicker.regional.ko = {
						closeText : "\ub2eb\uae30",
						prevText : "\uc774\uc804\ub2ec",
						nextText : "\ub2e4\uc74c\ub2ec",
						currentText : "\uc624\ub298",
						monthNames : [ "1\uc6d4(JAN)", "2\uc6d4(FEB)",
								"3\uc6d4(MAR)", "4\uc6d4(APR)", "5\uc6d4(MAY)",
								"6\uc6d4(JUN)", "7\uc6d4(JUL)", "8\uc6d4(AUG)",
								"9\uc6d4(SEP)", "10\uc6d4(OCT)",
								"11\uc6d4(NOV)", "12\uc6d4(DEC)" ],
						monthNamesShort : [ "1\uc6d4", "2\uc6d4", "3\uc6d4",
								"4\uc6d4", "5\uc6d4", "6\uc6d4", "7\uc6d4",
								"8\uc6d4", "9\uc6d4", "10\uc6d4", "11\uc6d4",
								"12\uc6d4" ],
						dayNames : [ "\uc77c", "\uc6d4", "\ud654", "\uc218",
								"\ubaa9", "\uae08", "\ud1a0" ],
						dayNamesShort : [ "\uc77c", "\uc6d4", "\ud654",
								"\uc218", "\ubaa9", "\uae08", "\ud1a0" ],
						dayNamesMin : [ "\uc77c", "\uc6d4", "\ud654", "\uc218",
								"\ubaa9", "\uae08", "\ud1a0" ],
						weekHeader : "Wk",
						dateFormat : "yy-mm-dd",
						firstDay : 0,
						isRTL : !1,
						showMonthAfterYear : !0,
						yearSuffix : "",
						showOn : "both",
						buttonText : "\ub2ec\ub825",
						changeMonth : !0,
						changeYear : !0,
						showButtonPanel : !0,
						yearRange : "c-99:c+99"
					}, $.datepicker.setDefaults($.datepicker.regional.ko);
					var e = new Date, t = new Date, a = e.getMonth() + 1, o = e
							.getDate();
					a = a < 10 ? "0" + a : a, o = o < 10 ? "0" + o : o;
					var n = e.getFullYear() + "-" + a + "-" + o;
					t.setDate(e.getDate() - 7);
					var d = t.getMonth() + 1, r = t.getDate();
					d = d < 10 ? "0" + d : d, r = r < 10 ? "0" + r : r;
					var i = t.getFullYear() + "-" + d + "-" + r;
					$("#sdate").val(i), $("#edate").val(n), $("#sdate")
							.datepicker(), $("#sdate").datepicker("option",
							"maxDate", $("#edate").val()), $("#sdate")
							.datepicker(
									"option",
									"onClose",
									function(e) {
										$("#edate").datepicker("option",
												"minDate", e), $("#edate").val(
												e)
									}), $("#edate").datepicker(),
							$("#edate").datepicker("option", "minDate",
									$("#sdate").val()), $("#edate")
									.datepicker(
											"option",
											"beforeShow",
											function() {
												var e = $("#sdate").val()
														.split("-");
												e[1] = e[1] - 1;
												var t = new Date(e[0], e[1],
														e[2]), a = new Date(
														e[0], e[1], e[2]);
												a.setDate(t.getDate() + 7), $(
														"#edate").datepicker(
														"option", "maxDate", a)
											}), $("#edate").datepicker(
									"option",
									"onClose",
									function(e) {
										$("#sdate").datepicker("option",
												"maxDate", e)
									})
				});