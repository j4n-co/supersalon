
(function() {
  Spree.disableSaveOnClick = function() {
    return ($('form.edit_order')).submit(function() {
      return ($(this)).find(':submit, :image').attr('disabled', true).removeClass('primary').addClass('disabled');
    });
  };

  Spree.Checkout = {};

  Spree.ready(function($) {
    var fillStates, getCountryId, updateState;
    if (($('#checkout_form_address')).is('*')) {
      ($('#checkout_form_address')).validate();
      getCountryId = function(region) {
        return $('p#' + region + 'country select').val();
      };
      updateState = function(region) {
        var countryId;
        countryId = getCountryId(region);
        if (countryId != null) {
          if (Spree.Checkout[countryId] == null) {
            return $.get(Spree.routes.states_search, {
              country_id: countryId
            }, function(data) {
              Spree.Checkout[countryId] = {
                states: data.states,
                states_required: data.states_required
              };
              return fillStates(Spree.Checkout[countryId], region);
            });
          } else {
            return fillStates(Spree.Checkout[countryId], region);
          }
        }
      };
      fillStates = function(data, region) {
        var selected, stateInput, statePara, stateSelect, stateSpanRequired, states, statesRequired, statesWithBlank;
        statesRequired = data.states_required;
        states = data.states;
        statePara = $('p#' + region + 'state');
        stateSelect = statePara.find('select');
        stateInput = statePara.find('input');
        stateSpanRequired = statePara.find('state-required');
        if (states.length > 0) {
          selected = parseInt(stateSelect.val());
          stateSelect.html('');
          statesWithBlank = [
            {
              name: '',
              id: ''
            }
          ].concat(states);
          $.each(statesWithBlank, function(idx, state) {
            var opt;
            opt = ($(document.createElement('option'))).attr('value', state.id).html(state.name);
            if (selected === state.id) {
              opt.prop('selected', true);
            }
            return stateSelect.append(opt);
          });
          stateSelect.prop('disabled', false).show();
          stateInput.hide().prop('disabled', true);
          statePara.show();
          stateSpanRequired.show();
          if (statesRequired) {
            stateSelect.addClass('required');
          }
          return stateInput.removeClass('required');
        } else {
          stateSelect.hide().prop('disabled', true);
          stateInput.show();
          if (statesRequired) {
            stateSpanRequired.show();
            stateInput.addClass('required');
          } else {
            stateInput.val('');
            stateSpanRequired.hide();
            stateInput.removeClass('required');
          }
          statePara.toggle(!!statesRequired);
          stateInput.prop('disabled', !statesRequired);
          stateInput.removeClass('hidden');
          return stateSelect.removeClass('required');
        }
      };
      
      ($('p#bcountry select')).change(function() {
        var countryId;
        updateState('b');
        if ($('input#order_use_billing').is(':checked')) {
          countryId = $('#bcountry select').val();
          return $('#scountry select').val(countryId).change();
        }
      });
      
      ($('p#bstate input')).change(function() {
        if ($('input#order_use_billing').is(':checked')) {
          return $('#sstate input').val($('#bstate input').val());
        }
      });
      
      ($('p#bstate select')).change(function() {
        //console.log("triggering right field");
        if ($('input#order_use_billing').is(':checked')) {
          return $('p#sstate select').val($('#bstate select').val());
        }
      });
      
      ($('p#scountry select')).change(function() {
        return updateState('s');
      });
      
      updateState('b');
      updateState('s');
      
      $('input#order_use_billing').change(function() {
        if (($(this)).is(':checked')) {
          ($('#shipping .inner')).hide();
          return ($('#shipping .inner input, #shipping .inner select')).prop('disabled', true);
        } else {
          ($('#shipping .inner')).show();
          ($('#shipping .inner input, #shipping .inner select')).prop('disabled', false);
          return updateState('s');
        }
      }).trigger('change');
    }
    if (($('#checkout_form_payment')).is('*')) {
      ($('input[type="radio"][name="order[payments_attributes][][payment_method_id]"]')).click(function() {
        ($('#payment-methods li')).hide();
        if (this.checked) {
          return ($('#payment_method_' + this.value)).show();
        }
      });
      ($(document)).on('click', '#cvv_link', function(event) {
        var windowName, windowOptions;
        windowName = 'cvv_info';
        windowOptions = 'left=20,top=20,width=500,height=500,toolbar=0,resizable=0,scrollbars=1';
        window.open(($(this)).attr('href'), windowName, windowOptions);
        return event.preventDefault();
      });
      return ($('input[type="radio"]:checked')).click();
    }
  });

}).call(this);
