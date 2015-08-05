function ValidateFieldsetGroup(evt) {

    ResetValidators();

    var isValid = true;

    // Get Validator & Settings
    var validator = $(evt.data.formID).validate();
    var settings = validator.settings;

    // Find the parent control that contains the elements to be validated
    var $group = $(evt.currentTarget).parents(evt.data.fieldsetClass);

    // Grab all the input elements (minus items listed below)
    $group.find(":input")
				.not(":submit, :reset, :image, [disabled]")
				.not(settings.ignore)
				.each(function (i, item) {
				    // Don't validate items without rules
				    if (!validator.objectLength($(item).rules()))
				        return true;

				    if (!$(item).valid())
				        isValid = false;
				});

    // If any control is the group fails, prevent default actions (aka: Submit)
    if (!isValid)
        evt.preventDefault();
}