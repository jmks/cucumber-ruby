Feature: Cucumber command line
  In order to find out what step definitions need to be implemented
  Developers should always see what step definition is missing

  Scenario: Get info at arbitrary levels of nesting
    When I run cucumber features/call_undefined_step_from_step_def.feature
    Then it should pass with
      """
      Feature: Calling undefined step

        Scenario: Call directly                                # features/call_undefined_step_from_step_def.feature:3
          Given a step definition that calls an undefined step # features/step_definitions/sample_steps.rb:19
            Undefined step: "this does not exist" (Cucumber::StepMother::Undefined)
            ./features/step_definitions/sample_steps.rb:20:in `/^a step definition that calls an undefined step$/'

        Scenario: Call via another                                         # features/call_undefined_step_from_step_def.feature:6
          Given call step "a step definition that calls an undefined step" # features/step_definitions/sample_steps.rb:23
            Undefined step: "this does not exist" (Cucumber::StepMother::Undefined)
            ./features/step_definitions/sample_steps.rb:20:in `/^a step definition that calls an undefined step$/'

      2 scenarios
      2 undefined steps

      You can implement step definitions for missing steps with these snippets:

      Given /^this does not exist$/ do
      end


      """

